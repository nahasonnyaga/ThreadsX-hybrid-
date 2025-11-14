/**
 * Minimal Firebase stub using modular-style surface. Replace with real Firebase config.
 */
export const FirebaseService: any = {
  db: {
    collection: (name:string) => ({
      get: async () => ({ docs: [] }),
      doc: (id:string) => ({ set: async (v:any) => {} })
    })
  }
};
