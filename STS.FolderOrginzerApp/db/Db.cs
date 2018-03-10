using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace STS.FolderOrginzerApp
{
    public static class Db
    {
        public static void ExcueteQuery(string sqlQuery)
        {
            using (SqlConnection connection = new SqlConnection((ConfigurationManager.ConnectionStrings["Default"].ConnectionString)))
            {
                SqlCommand command = new SqlCommand(sqlQuery, connection);
                connection.Open();
                int result = command.ExecuteNonQuery();
            }
        }
    }
}
