package itm;

      import java.io.IOException;

      import javax.servlet.Filter;

      import javax.servlet.FilterChain;

      import javax.servlet.FilterConfig;

      import javax.servlet.ServletException;

      import javax.servlet.ServletRequest;

      import javax.servlet.ServletResponse;

      /**

      * Filtro para que la aplicación acepte codificación en formato UTF-8
      * Se usa al recibir datos de formularios
      */

      public class UTF8Filter implements Filter {

            private String encoding;

            /**

            * Recogemos el tipo de codificación definido en el web.xml

            * Si no se hubiera especificado ninguno se toma "UTF-8" por defecto

            */

            public void init( FilterConfig filterConfig ) throws ServletException {

                  encoding = filterConfig.getInitParameter( "requestEncoding" );

                  if( encoding == null ) {

                        encoding = "UTF-8";

                  }

            }

            /**

            * Metemos en la request el formato de codificacion UTF-8

            */

            public void doFilter( ServletRequest request, ServletResponse response, FilterChain fc )

                  throws IOException, ServletException {
                        request.setCharacterEncoding( encoding );

                        fc.doFilter( request, response );

            }

            public void destroy() {}

    }