package com.example.rosacrm.repository;

import com.example.rosacrm.entity.Note;
import com.example.rosacrm.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NoteRepository extends CrudRepository<Note, Long> {
    @Query("select n from Note n where n.client.user = ?1")
    List<Note> findClientNoteByUser(User user);

    @Query("select n from Note n where n.prospect.user = ?1")
    List<Note> findProspectNoteByUser(User user);
}
