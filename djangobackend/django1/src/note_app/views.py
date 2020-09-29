from django.shortcuts import render , redirect, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.models import User
from .models import Note 
from .forms import NoteForm
from django.contrib import messages
from accounts.models import Profile

# Create your views here.

#show all note 
def all_notes(request):
    user = request.user
    profile = get_object_or_404(Profile , user=user )
    all_notes = Note.objects.filter(user = user )
    context={
        'all_notes' : all_notes,
        'profile' : profile
    }
    return render(request, 'notes.html', context)



#show one note 
def detail(request, slug):
    note = Note.objects.get(slug=slug)
    all_notes = Note.objects.filter(user = user )
    context = {
        'note' : note,
        'profile' : profile
    }
    return render(request, 'one_notes.html', context)
    


def note_add(request):
    user = request.user
    profile = get_object_or_404(Profile , user=user )
    if request.method == 'POST':
        form = NoteForm(request.POST)
        if form.is_valid:
            new_form = form.save(commit=False)
            new_form.user = request.user
            new_form.save()
            messages.success(request, 'Profile details updated.')
            return redirect('/note')
    else:

        form = NoteForm()
    context = {
        'form' : form,
        'profile' : profile
    }
    return render(request, 'add.html', context)



def edit(request, slug):
     user = request.user
     profile = get_object_or_404(Profile , user=user )
     notes = get_object_or_404( Note,slug=slug)
     if request.method == 'POST':
        form = NoteForm(request.POST, instance=notes)
        if form.is_valid:
            new_form = form.save(commit=False)
            new_form.user = request.user
            new_form.save()
            messages.success(request, 'edit notes successing ')
            return redirect('/note')
     else:
        form = NoteForm(instance=notes)

     context = {
        'form' : form,
        'profile' : profile
     }
     return render(request, 'edit.html', context)