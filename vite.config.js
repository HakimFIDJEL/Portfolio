// import { defineConfig } from 'vite';

// export default defineConfig({
//     root: './themes/portfolio',
//     server: {
//         watch: {
//             include: ['themes/portfolio/**/*'],
//         },
//         proxy: {
//             '/': 'http://127.0.0.1:8000',
//         },
//     },
//     build: {
//         outDir: 'themes/portfolio/assets/dist',
//     },
// });

export default {
  root: './themes/portfolio',
  server: {
    // proxy: {
    //   '/': 'http://127.0.0.1:8000',
    // },
    watch: {
      extensions: ['htm', 'html', 'css', 'js', 'vue'],
      include: ['./themes/portfolio/**/*'],
    }
  },
  build: {
    outDir: 'dist',
  },
};
