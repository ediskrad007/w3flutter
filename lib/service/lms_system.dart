import '../model/course.dart';

import '../model/student.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
 
  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }
 
 
  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);
 
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  } 
  // mada 1 
  Course? _findCourseOrNull(String courseId){
    for (Course c in courses){
      if(c.id==courseId){
        return c ;
      }
    }
    return null ;
  }
  void addCourse({required String courseId , required String courseName }){
    Course? course = _findCourseOrNull(courseId);
    if (course != null){
      throw Exception('alreasdy exist');
    }
    courses.add(Course(id: courseId, name: courseName));
  }
  void removeCourse ({required String courseId }){
    Course? course = _findCourseOrNull(courseId);
    if(course==null){
      throw Exception('course not found');
    }
   courses.removeWhere((course) => course.id == courseId);
  }
  void enrollStu({required String studentId , required String courseId}){
    Student? students = _findStudentOrNull(studentId);
    if(students==null){
      throw Exception('not found');
    }
    Course? courses = _findCourseOrNull(courseId);
    if(courses==null){
      throw Exception('not found');
    }
    if(courses.studentIds.contains(studentId)){
      throw Exception('eroll done');
    }
    courses.studentIds.add(studentId);
  }
}
