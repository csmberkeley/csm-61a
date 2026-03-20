class GBO:
    max_students = 4
    def __init__(self, tour_guide):
        self.tour_guide = tour_guide
        self.students = []
            
    def addStudent(Student s):
        //implementation omitted
    
    def __repr__(self):
        return f"GBO(guide={repr(self.tour_guide)}, members={repr(self.students)})"
    
    def __str__(self): 
        if (len(self.students) == 0):
            return f"No students in {self.tour_guide}'s tour group"
        return f"{self.students[-1]} recently joined {self.tour_guide}'s tour group"
    
    
class Student:
    def __init__(self, name):
            self.name = name
            self.tour_guide = null
    
    def __str__(self): 
        if (self.tour_guide == null):
            return f"{self.name} has no group :("
        return f"{self.name} is in {self.tour_guide}'s group"
    
    def __repr__(self):
        return f"Student({repr(self.name)})"


