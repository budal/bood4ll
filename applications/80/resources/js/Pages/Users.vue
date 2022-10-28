<script setup>
import AppLayout from '@/Layouts/AppLayout.vue';
import { Link } from '@inertiajs/inertia-vue3';
</script>

<script>
export default {
    props: {
        items: Object,
    },
}
</script>

<template>
    <AppLayout title="Users">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                {{ $t('Users') }}
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                    <div v-if="items">
                        <div class="p-6 sm:px-20 bg-white border-b border-gray-200">
                            <div class="mt-2 text-2xl">
                                {{ $t('Select the user to manage') }}
                            </div>
                        </div>
                        <div class="p-2 pl-9 pr-9 bg-gray-200 bg-opacity-25 grid grid-cols-1 md:grid-cols-1">
                            <Link v-for="item in items" :href="route(item.route)" class="">
                                <div class="p-2 border-gray-200 md:border-1 duration-500 hover:bg-gray-200 hover:scale-105">
                                    <div class="flex items-center">
                                        <p class="w-8 h-8 text-gray-100">
                                            <div v-html="item.logo"></div>
                                        </p>
                                        <div class="ml-4 text-lg text-gray-600 leading-7 font-semibold">
                                            {{ $t(item.title) }}
                                        </div>
                                    </div>

                                    <div class="ml-12">
                                        <div class="mt-2 text-sm text-gray-500">
                                            {{ $t(item.description) }}
                                        </div>
                                    </div>
                                </div>
                            </Link>
                        </div>
                    </div>
                    <p v-if="!items" class="text-center p-4">Você não possui nenhum aplicativo liberado.</p>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
