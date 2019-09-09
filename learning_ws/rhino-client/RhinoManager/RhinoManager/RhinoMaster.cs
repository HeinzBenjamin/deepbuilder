using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace RhinoManager
{
    public class RhinoMaster
    {
        public static int Start()
        {
            Console.WriteLine("########## STARTING RHINO ##########");

            Process StartProc = new Process();
            string userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name.Split('\\')[1];
            //StartProc.StartInfo.WorkingDirectory = "C:\\Users\\" + userName + "\\OneDrive - felbrich.com\\Work\\01 Academic\\04 Robotic Reinforcement Learning\\04 Full Cycle Tests\\Managed Learning";
            var path = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            path = Path.GetFullPath(Path.Combine(path, @"..\..\..\..\..\"));
            StartProc.StartInfo.FileName = "C:\\Program Files\\Rhino 6\\System\\Rhino.exe";
            StartProc.StartInfo.Arguments = "/nosplash /runscript=\"-grasshopper editor load document open \"\""+path+"RhinoManager_MASTERFILE.gh\"\" _enter\" \""+path+"\\RhinoManager_MASTERFILE.3dm\"";
            Console.WriteLine(" >> Starting process: "+StartProc.StartInfo.FileName);
            Console.WriteLine(" >> With Arguments: " + StartProc.StartInfo.Arguments);
            StartProc.StartInfo.CreateNoWindow = true;
            Task.Factory.StartNew(() => StartProc.Start());

            //would be better if there was a better solution to this, but for now it'll just sleep a bit
            System.Threading.Thread.Sleep(15000);
            Console.WriteLine(" >> Process ID: " + StartProc.Id);
            return StartProc.Id;
        }

        public static void Kill(int pid)
        {
            Console.WriteLine("########## KILLING RHINO "+pid+" ##########");
            try
            {
                Process KillProc = Process.GetProcessById(pid);
                if (KillProc.ProcessName == "Rhino")
                    KillProc.Kill();
                else
                    Console.WriteLine("CAN NOT KILL! WRONG PID. GIVEN PID POINTS TO: " + KillProc.ProcessName);
            }
            catch
            {
                Console.WriteLine("########## KILLING RHINO " + pid + " WAS ALREADY DEAD ##########");
            }
        }

        public static void KillAll()
        {
            Console.WriteLine("########## KILLING ALL RHINOS ##########");
            foreach (var proc in Process.GetProcessesByName("Rhino"))
            {
                proc.Kill();
            }
        }

        public static int Restart(int pid)
        {
            Kill(pid);
            System.Threading.Thread.Sleep(500);
            return Start();
        }
    }
}
