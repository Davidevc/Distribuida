package body Book.Additional_Operations is

   function Get_Extended_Title return String is
   begin
      return "Book Title: " & Get_Title;
   end Get_Extended_Title;

   function Get_Extended_Author return String is
   begin
      --  "Author" string declared in the body of Book package is not
      --  visible here. Therefore, we cannot write:
      --
      --  return "Book Author: " & Author;

      return "Book Author: " & Get_Author; -- usando la funcion a la que si se tiene acceso de el paquete padre book
      --se puede obtener la variable del autor, declarada dentro de book.adb
   end Get_Extended_Author;

end Book.Additional_Operations;
