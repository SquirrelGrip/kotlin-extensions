package com.github.squirrelgrip.extension.collection

fun Array<String>.filterByExpression(
    expression: String?,
    aliases: Map<String, String> = emptyMap()
): List<String> =
    StringCompiler.filter(
        this,
        expression,
        aliases
    ) { it }

fun <T> Array<T>.mapFilterByExpression(
    expression: String?,
    aliases: Map<String, String> = emptyMap(),
    transform: (T) -> String = { it.toString() }
): List<T> =
    StringCompiler.filter(
        this,
        expression,
        aliases,
        transform
    )

fun <T> Array<T>.flatMapFilterByExpression(
    expression: String?,
    aliases: Map<String, String> = emptyMap(),
    transform: (T) -> Collection<String> = { setOf(it.toString()) }
): List<T> =
    CollectionStringCompiler.filter(
        this,
        expression,
        aliases,
        transform
    )

fun Array<String>.partitionByExpression(
    expression: String?,
    aliases: Map<String, String> = emptyMap()
): Pair<List<String>, List<String>> =
    StringCompiler.partition(
        this,
        expression,
        aliases
    ) { it }

fun <T> Array<T>.mapPartitionByExpression(
    expression: String?,
    aliases: Map<String, String> = emptyMap(),
    transform: (T) -> String = { it.toString() }
): Pair<List<T>, List<T>> =
    StringCompiler.partition(
        this,
        expression,
        aliases,
        transform
    )

fun <T> Array<T>.flatMapPartitionByExpression(
    expression: String?,
    aliases: Map<String, String> = emptyMap(),
    transform: (T) -> Collection<String> = { setOf(it.toString()) }
): Pair<List<T>, List<T>> =
    CollectionStringCompiler.partition(
        this,
        expression,
        aliases,
        transform
    )
