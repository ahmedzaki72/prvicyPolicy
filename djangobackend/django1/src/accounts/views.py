from django.shortcuts import render , redirect
from django.contrib.auth.forms import UserCreationForm , PasswordChangeForm
from django.contrib.auth import login , authenticate
from .models import Profile
from django.shortcuts import get_object_or_404
from .forms import UserForm , ProfileForms
from django.contrib import messages

# Create your views here.
def home(request):
    pass



def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)

        if form.is_valid:
            form.save()
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password1')
            user = authenticate(username = username , password = password )
            login(request, user)
            return redirect('/note')
    else :
        form = UserCreationForm         
    context = {
        'form' : form ,
    }
    return render(request, 'signup.html', context)



def profile(request , slug):
    profile = get_object_or_404(Profile, slug=slug)
    context = {
       'profile' : profile
    }

    return render(request, 'profile.html', context)
    

def edit_profile(request , slug):
    profile =  profile = get_object_or_404(Profile, slug=slug)

    if request.method == 'POST':
        userForm = UserForm(request.POST , instance=request.user)
        profileForm = ProfileForms(request.POST, request.FILES , instance=profile)
        if userForm.is_valid() and profileForm.is_valid():
            userForm.save()
          #  new_profile =  profileForm(commit=False)
          #  new_profile.user = request.user
          #  new_profile.save()
            profileForm.save()
            messages.success(request, 'edit profiles successing ')
            return redirect('/')
    
    else: 
        userForm = UserForm(instance=request.user)
        profileForm = ProfileForms(instance=profile)

        context = {
            'userForm' : userForm,
            'profileForm' : profileForm
        }

        return render(request, 'edit_profile.html' , context )

def change_password(request, slug):
    profile =  profile = get_object_or_404(Profile, slug=slug)  

    if request.method == 'POST' :
        password_form = PasswordChangeForm(request.user, request.POST)
        if password_form.is_valid() :
            password_form.save()
            
            return redirect('/')

    else : 
        password_form = PasswordChangeForm(request.user)


    context = {
        'password_form' : password_form
    }   

    return render(request, 'change_password.html' , context) 