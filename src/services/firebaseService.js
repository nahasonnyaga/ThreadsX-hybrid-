/**
 * Minimal Firebase stub using modular-style surface. Replace with real Firebase config.
 */
export const FirebaseService = {
    db: {
        collection: (name) => ({
            get: async () => ({ docs: [] }),
            doc: (id) => ({ set: async (v) => { } })
        })
    }
};
