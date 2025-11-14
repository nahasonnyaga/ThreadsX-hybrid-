/**
 * Minimal Supabase stub for dev - replace with real client & env variables when ready.
 */
export const SupabaseService = {
    from: (table) => ({
        select: async () => ({ data: [], error: null }),
        insert: async (rows) => ({ data: rows, error: null })
    })
};
