using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Hosting;

namespace RhinoManager.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class RhinoRemoteController : ControllerBase
    {
        // GET RhinoRemote/restart
        [HttpGet("{req}")]
        public ActionResult<int> Get(string req)
        {
            if (req == "Start")
            {
                return RhinoMaster.Start();
            }

            else if (req.StartsWith("Kill_"))
            {
                if (req == "Kill_all")
                    RhinoMaster.KillAll();
                else
                {
                    int pid = int.Parse(req.Split(new char[] { '_' })[1]);
                    RhinoMaster.Kill(pid);
                }
                return 0;
            }

            else if (req.StartsWith("Restart_"))
            {
                int pid = int.Parse(req.Split(new char[] { '_' })[1]);
                return RhinoMaster.Restart(pid);
            }

            else
            {
                Console.WriteLine("########## ERROR WRONG REQUEST ERROR ##########");
            }

            return -1;
        }
    }
}