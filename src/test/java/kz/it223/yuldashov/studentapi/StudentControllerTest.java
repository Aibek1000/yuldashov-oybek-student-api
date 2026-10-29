package kz.it223.yuldashov.studentapi;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

class StudentControllerTest {

    private final StudentRepository repo = Mockito.mock(StudentRepository.class);
    private final StudentController controller = new StudentController(repo);

    @Test
    void getByIdReturnsStudent() {
        Student s = new Student("Oybek Yuldashov", "oybek.yuldashov@example.com", "IT2-23");
        when(repo.findById(1L)).thenReturn(Optional.of(s));
        assertEquals(200, controller.getById(1L).getStatusCode().value());
    }

    @Test
    void getByIdReturns404WhenMissing() {
        when(repo.findById(999L)).thenReturn(Optional.empty());
        assertEquals(404, controller.getById(999L).getStatusCode().value());
    }
}
