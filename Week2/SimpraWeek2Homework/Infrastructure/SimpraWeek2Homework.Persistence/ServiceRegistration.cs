using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using SimpraWeek2Homework.Application.Repositories.Staffs;
using SimpraWeek2Homework.Persistence.Contexts;
using SimpraWeek2Homework.Persistence.Repositories.Staffs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpraWeek2Homework.Persistence
{
    public static class ServiceRegistration
    {
        public static void AddPersistenceServices(this IServiceCollection services)
        {
            services.AddDbContext<SimpraWeek2HomeworkDbContext>(options => options.UseSqlServer(Configuration.ConnectionString), ServiceLifetime.Scoped);
            services.AddScoped<IStaffReadRepository, StaffReadRepository>();
            services.AddScoped<IStaffWriteRepository, StaffWriteRepository>();
        }
    }
}
