﻿using VetAppointment.UI.Pages.Models;

namespace VetAppointment.UI.Pages.Services
{
    public interface IAccountDataService
    {
        Task<string> AddAccount(AccountModel account);
    }
}