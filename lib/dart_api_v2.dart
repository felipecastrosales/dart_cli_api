import 'repositories/student_repository.dart';

Future<void> main() async {
  final studentRepository = StudentRepository();
  final students = await studentRepository.getStudents();
  print(students);

  print('\n#\n' * 2);

  final student = await studentRepository.getById(1);
  print(student);

  for (var course in student.courses) {
    print(
        'Course: ${course.title}, description: ${course.description}, is student: ${course.isStudent ? 'active' : 'inactive'}');
  }
}
