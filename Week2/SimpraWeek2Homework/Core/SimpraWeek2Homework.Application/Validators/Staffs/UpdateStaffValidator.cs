using FluentValidation;
using SimpraWeek2Homework.Application.ViewModels.Staff;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpraWeek2Homework.Application.Validators.Staffs
{
    public class UpdateStaffValidator : AbstractValidator<VM_Update_Staff>
    {
        public UpdateStaffValidator()
        {
            RuleFor(x => x.FirstName)
    .NotEmpty()
        .WithMessage("Lütfen adınızı boş geçmeyiniz.")
    .NotNull()
        .WithMessage("Lütfen adınızı boş geçmeyiniz.")
    .MaximumLength(50);

            RuleFor(x => x.LastName)
                .NotEmpty()
                    .WithMessage("Lütfen soyadınızı boş geçmeyiniz.")
                .NotNull()
                    .WithMessage("Lütfen soyadınızı boş geçmeyiniz")
                .MaximumLength(50);

            RuleFor(x => x.Email)
                .NotEmpty()
                    .WithMessage("Lütfen mail adresinizi giriniz.")
                .NotNull()
                    .WithMessage("Lütfen mail adresinizi giriniz.")
                .EmailAddress()
                    .WithMessage("Lütfen mail adresinizi doğru formatta giriniz.")
                .MaximumLength(50);

            RuleFor(x => x.Phone)
                .NotEmpty()
                    .WithMessage("Lütfen telefon numaranızı giriniz.")
                .NotNull()
                    .WithMessage("Lütfen telefon numaranızı giriniz")
                .MaximumLength(11)
                .MinimumLength(11)
                    .WithMessage("Telefon numaranızı başında sıfır bulunacak şekilde giriniz.");
        }
    }
}
