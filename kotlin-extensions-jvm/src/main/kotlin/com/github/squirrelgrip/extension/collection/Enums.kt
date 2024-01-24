package com.github.squirrelgrip.extension.collection

import java.util.*

inline fun <reified E : Enum<E>> String?.filterByExpression(
    aliases: Map<String, String> = emptyMap()
): EnumSet<E> =
    StringCompiler.filter(enumValues<E>(), this, aliases) { it.name }.toEnumSet()

inline fun <reified E : Enum<E>> String?.partitionByExpression(
    aliases: Map<String, String> = emptyMap()
): Pair<EnumSet<E>, EnumSet<E>> =
    StringCompiler.partition(enumValues<E>(), this, aliases) { it.name }.let {
        it.first.toEnumSet() to it.second.toEnumSet()
    }

inline fun <reified E : Enum<E>> Collection<E>?.toEnumSet(): EnumSet<E> =
    if (this == null) {
        EnumSet.allOf(E::class.java)
    } else if (this.isEmpty()) {
        EnumSet.noneOf(E::class.java)
    } else {
        EnumSet.copyOf(this)
    }
