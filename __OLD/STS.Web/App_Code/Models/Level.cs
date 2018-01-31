using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Level
/// </summary>
public class Level
{
    public int Id { get; set; }
    public string Name { get; set; }
    public virtual ICollection<Session> Sessions { get; set; }
    public Level()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}