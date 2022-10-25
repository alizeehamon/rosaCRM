package com.example.rosacrm.utils;

import com.example.rosacrm.dto.entity.Note;

import java.util.Comparator;
import java.util.function.Function;
import java.util.function.ToDoubleFunction;
import java.util.function.ToIntFunction;
import java.util.function.ToLongFunction;

public class SortByDate implements Comparator<Note> {
    @Override
    public int compare(Note a, Note b) {
        return b.getNoteCreationDate().compareTo(a.getNoteCreationDate());
    }

    @Override
    public Comparator<Note> reversed() {
        return Comparator.super.reversed();
    }

    @Override
    public Comparator<Note> thenComparing(Comparator<? super Note> other) {
        return Comparator.super.thenComparing(other);
    }

    @Override
    public <U> Comparator<Note> thenComparing(Function<? super Note, ? extends U> keyExtractor, Comparator<? super U> keyComparator) {
        return Comparator.super.thenComparing(keyExtractor, keyComparator);
    }

    @Override
    public <U extends Comparable<? super U>> Comparator<Note> thenComparing(Function<? super Note, ? extends U> keyExtractor) {
        return Comparator.super.thenComparing(keyExtractor);
    }

    @Override
    public Comparator<Note> thenComparingInt(ToIntFunction<? super Note> keyExtractor) {
        return Comparator.super.thenComparingInt(keyExtractor);
    }

    @Override
    public Comparator<Note> thenComparingLong(ToLongFunction<? super Note> keyExtractor) {
        return Comparator.super.thenComparingLong(keyExtractor);
    }

    @Override
    public Comparator<Note> thenComparingDouble(ToDoubleFunction<? super Note> keyExtractor) {
        return Comparator.super.thenComparingDouble(keyExtractor);
    }
}