package com.github.squirrelgrip.extension.collection

fun Sequence<String>.filterByExpression(
    expression: String?,
    aliases: Map<String, String> = emptyMap()
): Sequence<String> =
    SequenceStringCompiler.filter(
        this,
        expression,
        aliases
    ) { sequenceOf(it) }

fun <T> Sequence<T>.mapFilterByExpression(
    expression: String?,
    aliases: Map<String, String> = emptyMap(),
    transform: (T) -> String = { it.toString() }
): Sequence<T> =
    StringCompiler.filter(
        this,
        expression,
        aliases,
        transform
    )

fun <T> Sequence<T>.flatMapFilterByExpression(
    expression: String?,
    aliases: Map<String, String> = emptyMap(),
    transform: (T) -> Collection<String> = { listOf(it.toString()) }
): Sequence<T> =
    CollectionStringCompiler.filter(
        this,
        expression,
        aliases,
        transform
    )

fun Sequence<String>.partitionByExpression(
    expression: String?,
    aliases: Map<String, String> = emptyMap()
): Pair<List<String>, List<String>> =
    SequenceStringCompiler.partition(
        this,
        expression,
        aliases
    ) { sequenceOf(it) }

fun <T> Sequence<T>.mapPartitionByExpression(
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

fun <T> Sequence<T>.flatMapPartitionByExpression(
    expression: String?,
    aliases: Map<String, String> = emptyMap(),
    transform: (T) -> Collection<String> = { listOf(it.toString()) }
): Pair<List<T>, List<T>> =
    CollectionStringCompiler.partition(
        this,
        expression,
        aliases,
        transform
    )



