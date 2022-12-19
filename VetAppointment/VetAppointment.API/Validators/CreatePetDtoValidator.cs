﻿using FluentValidation;
using VetAppointment.API.Dtos.Create;

namespace VetAppointment.API.Validators
{
    public class CreatePetDtoValidator : AbstractValidator<CreatePetDto>
    {
        public CreatePetDtoValidator()
        {
            RuleFor(dto => dto.Name).NotNull().NotEmpty().Length(1, 100);
            RuleFor(dto => dto.Birthdate).NotNull().NotEmpty().Must(Validations.BeValidDate);
            RuleFor(dto => dto.Race).NotNull().NotEmpty().Must(Validations.BeInAnimalRaceEnum);
            RuleFor(dto => dto.Gender).NotNull().NotEmpty().Must(Validations.BeInAnimalGenderEnum);
        }
    }
}
