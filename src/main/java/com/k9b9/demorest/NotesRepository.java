package com.k9b9.demorest;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(collectionResourceRel = "notes", path = "notes")
public interface NotesRepository extends PagingAndSortingRepository<Notes, Long> {

}