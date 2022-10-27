<script setup>
import AppLayout from '@/Layouts/AppLayout.vue';
import { Link } from '@inertiajs/inertia-vue3';

import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faUserSecret } from '@fortawesome/free-solid-svg-icons'

library.add(faUserSecret)

Vue.component('font-awesome-icon', FontAwesomeIcon)
Vue.config.productionTip = false
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
                            <div class="mt-8 text-2xl">
                                Selecione abaixo qual aplicação você deseja utilizar
                            </div>

                            <div class="mt-6 text-gray-500">
                                Os aplicativos liberados variam conforme os grupos dos quais participa, cujo acesso se encontra no canto superior direito de sua tela. 
                            </div>
                        </div>

                        <div class="p-3 bg-gray-200 bg-opacity-25 grid grid-cols-1 md:grid-cols-3">
                            <Link v-for="item in items" :href="route(item.route)" class="m-2 border duration-300 hover:bg-gray-200 hover:scale-110">
                                <div class="p-6 border-gray-200 md:border-1">
                                    <div class="flex items-center">
                                        <BookOpenIcon class="w-8 h-8 text-gray-400"/>
                                        <div class="ml-4 text-lg text-gray-600 leading-7 font-semibold">
                                            {{ item.title }}
                                        </div>
                                    </div>

                                    <div class="ml-12">
                                        <div class="mt-2 text-sm text-gray-500">
                                            {{ item.description }}
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
<script>
export default {
    props: {
        items: Object,
    },
}
</script>