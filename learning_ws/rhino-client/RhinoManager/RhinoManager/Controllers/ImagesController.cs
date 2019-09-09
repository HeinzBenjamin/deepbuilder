using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.FileProviders;

namespace RhinoManager.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ImagesController : ControllerBase
    {
        [HttpGet]
        public ActionResult Download(string session_name)
        {
            // use the id and read the corresponding file from it's physical location
            // and then return it: 
            
            var filePath = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
            filePath = Path.GetFullPath(Path.Combine(filePath, @"..\..\..\..\..\screenshots\"));
            var t = DateTime.Now.ToString("yyddMM-HHmmss");
            var fileName = session_name + t + ".zip";

            string dir_path = filePath + session_name;
            if (!Directory.Exists(filePath + session_name) || !Directory.EnumerateFileSystemEntries(dir_path).Any())
                return Ok();

            ZipFile.CreateFromDirectory(dir_path, filePath+fileName);

            IFileProvider provider = new PhysicalFileProvider(filePath);
            IFileInfo fileInfo = provider.GetFileInfo(fileName);
            var readStream = fileInfo.CreateReadStream();

            Directory.Delete(dir_path,true);


            return File(readStream, "application/zip", fileName);
        }
    }
}