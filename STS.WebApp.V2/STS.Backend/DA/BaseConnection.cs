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
                @"Data Source=.;Initial Catalog=STSDb;User ID=sa;Password=P@ssw0rd;";
            dbConnection = new System.Data.SqlClient.SqlConnection(connectionString);
        }
    }
}
