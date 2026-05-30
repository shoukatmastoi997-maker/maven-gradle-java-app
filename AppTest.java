package com.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class AppTest {

    @Test
    void helloWithEmptyName() {
        assertEquals("Hello, World", App.hello(""));
    }

    @Test
    void helloWithName() {
        assertEquals("Hello, DevOps", App.hello(" DevOps "));
    }
}

