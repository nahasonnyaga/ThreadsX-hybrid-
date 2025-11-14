/**
 * Minimal Supabase stub for dev - replace with real client & env variables when ready.
 */
export const SupabaseService: any = {
  from: (table: string) => ({
    select: async () => ({ data: [], error: null }),
    insert: async (rows: any[]) => ({ data: rows, error: null })
  })
};
