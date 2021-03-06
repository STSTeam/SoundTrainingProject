﻿using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using WebApi.Helpers;
using AutoMapper;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using WebApi.Repo;
using WebApi.DA;
using WebApi.Filters; 
using WebApi.Entities;
using Microsoft.AspNetCore.Http;
using System.IO;  

namespace WebApi
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
            services.AddCors();
          
            services.AddMvc(options =>
            {
                options.Filters.Add(new ApiExceptionFilter());
            });
            services.AddAutoMapper();

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

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            loggerFactory.AddConsole(Configuration.GetSection("Logging"));
            loggerFactory.AddDebug();

            // global cors policy
            app.UseCors(x => x
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader()
                .AllowCredentials());

            // redirect all non-api requests to angular 
            app.Use(async (context, next) =>
            {
                await next();
                if (context.Response.StatusCode == 404 &&
                   !Path.HasExtension(context.Request.Path.Value) &&
                   !context.Request.Path.Value.StartsWith("/api/"))
                {
                    context.Request.Path = "/index.html";
                    await next();
                }
            });

            app.UseAuthentication();

            app.UseMvcWithDefaultRoute();
            app.UseDefaultFiles();
            app.UseStaticFiles();
        }
    }
}
