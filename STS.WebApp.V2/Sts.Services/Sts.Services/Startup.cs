using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using Sts.Services.Dto;
using Sts.Services.Entities;
using Sts.Services.Filters;
using Sts.Services.Helpers;
using Sts.Services.IRepo;
using Sts.Services.Mappings;
using Sts.Services.Repo;

namespace Sts.Services
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddMvc(options =>
            {
                options.Filters.Add(new ApiExceptionFilter());
            }).SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            // Auto Mapper Configurations
            var mappingConfig = new MapperConfiguration(mc =>
            {
                mc.CreateMap<User, UserDto>();
                mc.CreateMap<UserDto, User>();

                // module mapping
                mc.CreateMap<Module, ModuleDto>();
                mc.CreateMap<ModuleDto, Module>();

                // session mapping
                mc.CreateMap<Session, SessionDto>();
                mc.CreateMap<SessionDto, Session>();

                // sounds mapper
                mc.CreateMap<Sound, SoundDto>();
                mc.CreateMap<SoundDto, Sound>();

                mc.CreateMap<Image, ImageDto>();
                mc.CreateMap<ImageDto, Image>();

                // sounds mapper
                //mc.CreateMap<MediaTypeNames.Image, ImageDto>();
                //mc.CreateMap<ImageDto, MediaTypeNames.Image>();

                // sixling mapper
                mc.CreateMap<Sixling, SixlingDto>();
                mc.CreateMap<SixlingDto, Sixling>();

                mc.CreateMap<GroupedSound, GroupedSound>();
            });

            IMapper mapper = mappingConfig.CreateMapper();
            services.AddSingleton(mapper);

            // configure strongly typed settings objects
            var appSettingsSection = Configuration.GetSection("AppSettings");
            services.Configure<AppSettings>(appSettingsSection);

            // configure jwt authentication
            var appSettings = appSettingsSection.Get<AppSettings>();
            var key = Encoding.ASCII.GetBytes(appSettings.Secret);
            services.AddAuthentication(x =>
                {
                    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                })
                .AddJwtBearer(x =>
                {
                    x.RequireHttpsMetadata = false;
                    x.SaveToken = true;
                    x.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(key),
                        ValidateIssuer = false,
                        ValidateAudience = false
                    };
                });

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            // configure DI for application services
            services.AddScoped<IUserRepository, UserDA>();
            services.AddScoped<IModuleRepository, ModuleDA>();
            services.AddScoped<ISessionRepository, SessionDA>();
            services.AddScoped<IUserTestRepository, UserTestDA>();
            services.AddScoped<IBaseRepository<Sound, int>, BaseDataAccess<Sound, int>>();
            services.AddScoped<IBaseRepository<Image, int>, BaseDataAccess<Image, int>>();
            services.AddScoped<IBaseRepository<UserTestSounds, int>, BaseDataAccess<UserTestSounds, int>>();
            services.AddScoped<IBaseRepository<Session, int>, BaseDataAccess<Session, int>>();
            services.AddScoped<IBaseRepository<UserCompletedModules, int>, BaseDataAccess<UserCompletedModules, int>>();
            services.AddScoped<IBaseRepository<UserCompletedSessions, int>, BaseDataAccess<UserCompletedSessions, int>>();
            services.AddScoped<IBaseRepository<SoundImages, int>, BaseDataAccess<SoundImages, int>>();
            services.AddScoped<IBaseRepository<Sixling, int>, BaseDataAccess<Sixling, int>>();

            services.AddSpaStaticFiles(spa => spa.RootPath = "wwwroot");
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
           
            // global cors policy
            app.UseCors(x => x
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader()
                .AllowCredentials());

            app.UseAuthentication();

            app.UseMvcWithDefaultRoute();

            app.UseDefaultFiles();
            app.UseStaticFiles();
            app.UseSpaStaticFiles();
            app.UseSpa(spa =>
            {
                spa.Options.SourcePath = "wwwroot";

                spa.Options.DefaultPageStaticFileOptions = new StaticFileOptions
                {
                    OnPrepareResponse = ctx =>
                    {
                        ctx.Context.Response.Headers.Add("X-Frame-Options", "SameOrigin");
                        ctx.Context.Response.Headers.Add("X-Content-Type-Options", "nosniff");
                        ctx.Context.Response.Headers.Add("Referrer-Policy", "no-referrer");
                        ctx.Context.Response.Headers.Add("X-XSS-Protection", "1; mode=block");
                    }
                };

                if (env.IsDevelopment())
                {
                    spa.UseProxyToSpaDevelopmentServer("http://localhost:4200");
                    spa.Options.StartupTimeout = TimeSpan.FromSeconds(600);
                }
            });
           
            app.UseMvc();
        }
    }
}
