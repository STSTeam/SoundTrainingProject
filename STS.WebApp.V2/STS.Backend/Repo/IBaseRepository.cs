using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Repo
{
    public interface IBaseRepository<TableEntity, Id>
    {
        DbConnection dbConnection { get; set; }

        int Add(TableEntity entity);

        int Update(TableEntity entity);

        int Delete(Id entityId);

        TableEntity Get(Id entityId);

        IEnumerable<TableEntity> GetList(object condtions);

        IEnumerable<TableEntity> GetAll();
    }
}
