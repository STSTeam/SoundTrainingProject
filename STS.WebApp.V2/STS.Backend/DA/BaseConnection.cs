using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.DA
{
    public class BaseConnection
    {
        public DbConnection dbConnection;
        public BaseConnection()   
        {
            var connectionString =
            @"Data Source=localhost\sqlexpress;Initial Catalog=STSDb;User ID=sa;Password=P@ssw0rd;";
            //var connectionString = @"Server=tcp:gjustsdb.database.windows.net,1433;Initial Catalog=STSDb;Persist Security Info=False;User ID=asalhani;Password=@Sarahzidane05@;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;";

            dbConnection = new System.Data.SqlClient.SqlConnection(connectionString);
        }
    }
}
