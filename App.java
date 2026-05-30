package com.example;

public class App {
    public static String hello(String name) {
        if (name == null || name.isBlank()) {
            return "Hello, World";
        }
        return "Hello, " + name.trim();
    }

    public static void main(String[] args) {
        String name = args.length > 0 ? args[0] : "";
        System.out.println(hello(name));
    }
}

