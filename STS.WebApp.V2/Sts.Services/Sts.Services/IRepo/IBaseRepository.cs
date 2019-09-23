using System.Collections.Generic;
using System.Data.Common;

namespace Sts.Services.IRepo
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
