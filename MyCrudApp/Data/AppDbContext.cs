using System;
using MyCrudApp.Models;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace MyCrudApp.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<Employee> Employees { get; set; }
    }
}

