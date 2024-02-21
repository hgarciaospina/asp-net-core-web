using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LeerData
{
    public class CursoInstructor
    {
        public int CursoId {get; set;}
        public int InstructorId {get; set;}
        public Curso Curso {get; set;}
        public Instructor Instructor {get; set;}
    }
}