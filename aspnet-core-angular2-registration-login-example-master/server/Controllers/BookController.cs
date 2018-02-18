using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using WebApi.Dtos;
using WebApi.Entities;
using WebApi.Helpers;
using WebApi.Services;

namespace WebApi.Controllers
{
    [Authorize]
    [Route("[controller]")]
    public class BookController : Controller
    {
        private IBookService _bookService;
        private IMapper _mapper;
        private readonly AppSettings _appSettings;

        public BookController(
            IBookService bookService,
            IMapper mapper,
            IOptions<AppSettings> appSettings)
        {
            _bookService = bookService;
            _mapper = mapper;
            _appSettings = appSettings.Value;
        }

        public IActionResult Create([FromBody]BookDto bookDto)
        {
            var book = _mapper.Map<Book>(bookDto);
            _bookService.Add(book);
            return Ok();
        }


    }
}