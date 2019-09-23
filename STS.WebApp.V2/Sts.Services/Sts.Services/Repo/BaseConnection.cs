using System.Data.Common;

namespace Sts.Services.Repo
{
    public class BaseConnection
    {
        public DbConnection dbConnection;
        public BaseConnection()
        {
            var connectionString = "Server=localhost;Initial Catalog=STSDb;User ID=sa;Password=Aa123456;Connection Timeout=30;";

            dbConnection = new System.Data.SqlClient.SqlConnection(connectionString);
        }
    }
}
