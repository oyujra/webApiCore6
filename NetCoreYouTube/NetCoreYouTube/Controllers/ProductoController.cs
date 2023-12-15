using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NetCoreYouTube.Models;
using NetCoreYouTube.Recursos;
using Newtonsoft.Json;
using System.Data;

namespace NetCoreYouTube.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        [HttpGet]
        [Route("Listar")]
        public dynamic ListarProducto() {
            List<Parametro> parametros = new List<Parametro> { 
            new Parametro("@Estado", 1)
            };
            DataTable tCategoria = DBDatos.Listar("Categoria_Listar",parametros);
            DataTable tProducto = DBDatos.Listar("Producto_Listar");

            string jsonCategoria = JsonConvert.SerializeObject(tCategoria);
            string jsonProducto = JsonConvert.SerializeObject(tProducto);

            return new { 
            success= true,
            message="existo",
            result = new {
                    categoria = JsonConvert.DeserializeObject<List<Categoria>>(jsonCategoria),
                    producto = JsonConvert.DeserializeObject<List<Producto>>(jsonProducto),
                }
            };
        }

        [HttpPost]
        [Route("agregar")]
        public dynamic AgregarProducto(Producto producto)
        {
            List<Parametro> parametros = new List<Parametro> {
            new Parametro("@IDCategoria", producto.IDCategoria),
            new Parametro("@Nombre", producto.Nombre),
            new Parametro("@Precio", producto.Precio)
            };
            bool existo = DBDatos.Ejecutar("Producto_Agregar", parametros);
            return new
            {
                success = existo,
                message = existo?"existo":"Error al Guardar",
                result = ""
            };
        }
    }
}
