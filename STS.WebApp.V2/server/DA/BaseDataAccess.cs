using Dapper;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;
using WebApi.DA;
using WebApi.Repo;

namespace WebApi.DA
{
    public class BaseDataAccess<TableEntity, Id> : BaseConnection, IBaseRepository<TableEntity, Id>
    {
        DbConnection IBaseRepository<TableEntity, Id>.dbConnection
        {
            get
            {
                return base.dbConnection;
            }

            set
            {
                base.dbConnection = value;
            }
        }

        public int Add(TableEntity entity)
        {
            return dbConnection.Insert<TableEntity>( entity).Value;
        }
        public int Update(TableEntity entity)
        {
            return dbConnection.Update(entity);
        }
        public int Delete(Id entityId)
        {
            return dbConnection.Delete<TableEntity>(entityId);
        }
        public TableEntity Get(Id entityId)
        {
            return dbConnection.Get<TableEntity>(entityId);
        }
        public IEnumerable<TableEntity> GetList(object condtions)
        {
            return dbConnection.GetList<TableEntity>(condtions);
        }
        public IEnumerable<TableEntity> GetAll()
        {
            return dbConnection.GetList<TableEntity>();
        }
    }
}
