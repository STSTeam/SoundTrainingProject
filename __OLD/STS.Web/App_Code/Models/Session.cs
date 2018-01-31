using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Session
/// </summary>
public class Session
{
    public int Id { get; set; }
    public string Name { get; set; }
    public virtual Level Level{ get; set; }
    public Session()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}