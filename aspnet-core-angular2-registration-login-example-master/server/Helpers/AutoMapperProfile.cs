using AutoMapper;
using WebApi.Dtos;
using WebApi.Entities;

namespace WebApi.Helpers
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            // user mapping
            CreateMap<User, UserDto>();
            CreateMap<UserDto, User>();
        }
    }
}