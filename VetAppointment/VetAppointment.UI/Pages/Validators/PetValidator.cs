﻿using FluentValidation;
using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Validators
{
    public class PetValidator : AbstractValidator<PetModel>
    {
        public PetValidator()
        {
            RuleFor(pet => pet.Name).NotEmpty().When(pet => !pet.Hidden).WithMessage("Name cannot be empty.");
            RuleFor(pet => pet.Birthdate).NotEmpty().When(pet => !pet.Hidden).WithMessage("Birthdate cannot be empty."); 
            RuleFor(pet => pet.Race).NotEmpty().When(pet => !pet.Hidden).WithMessage("Race cannot be empty.");
            RuleFor(pet => pet.Gender).NotEmpty().When(pet => !pet.Hidden).WithMessage("Gender cannot be empty.");
            RuleFor(pet => pet.Birthdate).LessThan(DateTime.Now).When(pet => !pet.Hidden).WithMessage("Birthdate cannot be in the future.");
        }
    }
}
