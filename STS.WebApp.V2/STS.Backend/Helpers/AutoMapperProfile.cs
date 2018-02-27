using AutoMapper;
using System.Collections.Generic;
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

            // module mapping
            CreateMap<Module, ModuleDto>();
            CreateMap<ModuleDto, Module>();

            // session mapping
            CreateMap<Session, SessionDto>();
            CreateMap<SessionDto, Session>();

            // sounds mapper
            CreateMap<Sound, SoundDto>();
            CreateMap<SoundDto, Sound>();

            // sounds mapper
            CreateMap<Image, ImageDto>();
            CreateMap<ImageDto, Image>();

        }
    }
}