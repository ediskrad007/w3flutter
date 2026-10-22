import 'package:lms_layered_architecture_example/service/lms_system.dart';
import 'package:test/test.dart';



void main() {
  test('creates a student', () {
    final lms = LmsSystem();

    // Create a student
    lms.addStudent(studentId: 'S1', studentName: "ronan");

    expect(lms.students.first.name, 'ronan');

    // Remove the student
    lms.removeStudent(studentId: 'S1');
    expect(lms.students.length, 0);
    
  });
  // mada 1
  test('add and remove course', (){
    final lms = LmsSystem() ;
    lms.addCourse(courseId: 'C1', courseName: 'gamedev');
    expect(lms.courses.first.name, 'gamedev');
    lms.removeCourse(courseId: 'C1');
    expect(lms.courses.length, 0);
  });
  test('reject dup courseid', (){
    final lms = LmsSystem();
     lms.addCourse(courseId: 'C1', courseName: 'gamedev');
     expect(()=>lms.addCourse(courseId: 'C1', courseName: 'gamedev'), throwsException);
  });
  test('reject remove null', (){
    final lms = LmsSystem();
    lms.addCourse(courseId: 'C1', courseName: 'self_healing');
    expect(()=>lms.removeCourse(courseId: 'C2'), throwsException);
  });
}
