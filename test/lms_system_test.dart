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
  //mada 2 
  test('enroll exist student in coure', (){
    final lms = LmsSystem();
    lms.addCourse(courseId: 'c1', courseName: 'cyber');
    lms.addStudent(studentId: 's1', studentName: 'ronan orgero');
    lms.enrollStu(courseId: 'c1' , studentId: 's1');
    expect(lms.courses[0].studentIds.length , 1);
   
  });
  test('verify enroll recorded', (){
    final lms = LmsSystem();
   lms.addCourse(courseId: 'c1', courseName: 'cyber');
    lms.addStudent(studentId: 's1', studentName: 'ronan orgero');
    lms.enrollStu(courseId: 'c1' , studentId: 's1');
     expect(lms.courses.first.studentIds.contains('s1'), true);
  });
  test('reject enrolll if student or course not exist', (){
    final lms = LmsSystem();
   lms.addCourse(courseId: 'c1', courseName: 'cyber');
    lms.addStudent(studentId: 's1', studentName: 'ronan orgero');
    // no exist course
    expect(()=>lms.enrollStu(courseId: 'c111' , studentId: 's1'), throwsException);
    //no exist stdent 
    expect(()=>lms.enrollStu(courseId: 'c1' , studentId: 's112121'), throwsException);
  });
  test('reject dup enroll', (){
    final lms = LmsSystem();
     lms.addCourse(courseId: 'c1', courseName: 'cyber');
    lms.addStudent(studentId: 's1', studentName: 'ronan orgero');
    lms.enrollStu(courseId: 'c1' , studentId: 's1');
    expect(()=>lms.enrollStu(courseId: 'c1' , studentId: 's1'), throwsException);
  });
  // mada 3 
  test('remove existing enrollment', () {
  final lms = LmsSystem();
  lms.addStudent(studentId: 'S01', studentName: 'Ogero ronan');
  lms.addCourse(courseId: 'C01', courseName: 'flutter');
  lms.enrollStu(studentId: 'S01', courseId: 'C01');
  lms.discardStudentFromCourse(
    studentId: 'S01',
    courseId: 'C01',
  );
  expect(lms.courses[0].studentIds, isEmpty);
});
test('reject removal of nonexistent enrollment', () {
  final lms = LmsSystem();

  lms.addStudent(studentId: 'S01', studentName: 'Dara');
  lms.addCourse(courseId: 'C01', courseName: 'Dart');

  expect(
    () => lms.discardStudentFromCourse(
      studentId: 'S01',
      courseId: 'C01',
    ),
    throwsException,
  );
});
test('student and course still exist after enrollment is removed', () {
  final lms = LmsSystem();

  lms.addStudent(studentId: 'S01', studentName: 'orger ronan');
  lms.addCourse(courseId: 'C01', courseName: 'Dart');

  lms.enrollStu(studentId: 'S01', courseId: 'C01');

  lms.discardStudentFromCourse(
    studentId: 'S01',
    courseId: 'C01',
  );

  bool studentExists = false;
  for (var student in lms.students) {
    if (student.id == 'S01') {
      studentExists = true;
    }
  }

  bool courseExists = false;
  for (var course in lms.courses) {
    if (course.id == 'C01') {
      courseExists = true;
    }
  }

  expect(studentExists, true);
  expect(courseExists, true);
});




}
