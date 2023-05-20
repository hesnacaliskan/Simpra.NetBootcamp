using SimpraWeek2Homework.Application.Repositories.Staffs;
using SimpraWeek2Homework.Domain.Entities;
using SimpraWeek2Homework.Persistence.Contexts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpraWeek2Homework.Persistence.Repositories.Staffs
{
    public class StaffReadRepository : ReadRepository<Staff>, IStaffReadRepository
    {
        public StaffReadRepository(SimpraWeek2HomeworkDbContext context) : base(context)
        {
        }
    }
}
