using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Entities;
using WebApi.Helpers;

namespace WebApi.Services
{
    public interface IBookService
    {
        Book Add(Book model);   
    }

    public class BookService : IBookService
    {
        private DataContext _context;

        public BookService(DataContext context)
        {
            _context = context;
        }
        public Book Add(Book model)
        {
             _context.Books.Add(model);
            _context.SaveChanges();
            return model;
        }
    }
}
