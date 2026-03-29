class GBO:
    """
    >>> marley = Student("Marley")
    >>> g = GBO(marley)
    >>> str(g)
    "No students in Marley's tour group"
    >>> g.add_student(Student("Noah"))
    >>> g.add_student(Student("Billy"))
    >>> str(g)
    "Noah recently joined Marley's tour group"
    >>>g
    GBO(Student("Marley"), (Student("Noah"), Student("Billy")))
    """
    max_students = 4
    def __init__(self, tour_guide):
        self.tour_guide = tour_guide
        self.students = []
            
    def addStudent(Student s):
        //implementation omitted
    
    def __repr__(self):
        return _________________________
    
    def __str__(self): 
        if ___________:
            return ______________
        return _____________________
    
    
class Student:
    """
    >>>Bo = Student("Bob")
    >>>str(Bo)
    "Bob has no group :("
    >>> g.add_student(Bo)
    >>> str(g)
    "Bob is the most recent member of Marley's tour group"
    >>>str(Bo)
    "Bob is in Marley's tour group"
    """
    def __init__(self, name):
            self.name = name
            self.tour_guide = null
    
    def __str__(self):
        if _________:
            return _____________________________
        return __________________________
    
    def __repr__(self):
        return _______________
    


