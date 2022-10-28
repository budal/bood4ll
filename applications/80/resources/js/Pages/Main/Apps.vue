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
    <AppLayout title="Apps">
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                {{ $t('Apps') }}
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                    <div v-if="items">
                        <div class="p-6 sm:px-20 bg-white border-b border-gray-200">
                            <div class="mt-2 text-2xl">
                                {{ $t('Select the app you want to use') }}
                            </div>

                            <div class="mt-6 text-gray-500">
                                {{ $t('Apps are disponible according to the groups that do you participate, whose access is located in the upper right corner of your screen.')}} 
                            </div>
                        </div>
                        <div class="p-3 bg-gray-200 bg-opacity-25 grid grid-cols-1 md:grid-cols-3">
                            <Link v-for="item in items" :href="route(item.route)" class="m-1 border duration-300 hover:bg-gray-200 hover:scale-105">
                                <div class="p-6 border-gray-200 md:border-1">
                                    <div class="flex items-center">
                                        <p class="w-8 h-8 text-gray-100">
                                            <div v-html="item.logo"></div>
                                        </p>
                                        <div class="ml-4 text-lg text-gray-600 leading-7 font-semibold">
                                            {{ $t(item.title) }}
                                        </div>
                                    </div>

                                    <div class="ml-12">
                                        <div class="mt-2 text-sm text-gray-500 text-justify">
                                            {{ $t(item.description) }}
                                        </div>
                                    </div>
                                </div>
                            </Link>
                        </div>
                    </div>
                    <p v-if="!items" class="text-center p-4">{{ $t('There is no apps to use.')}}</p>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
