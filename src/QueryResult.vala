/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	/**
	 * A QueryResult object. Returned by Query.execute.
	 */
	public interface QueryResult : Object {

		/**
		 * Returns an array of all the column names in the table view of this result set.
		 *
		 * @return An array holding the column names.
		 *
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract string[] get_column_names ();

		/**
		 * Returns an array of {@link Row} of the result table.
		 *
		 * The rows are returned according to the ordering specified in the query.
		 *
		 * @throws RepositoryException if this call is the second time either get_rows or get_nodes
		 *                                    has been called on the same QueryResult object or if another error occurs.
		 */
		public abstract Row[] get_rows ();

		/**
		 * Returns all nodes that match the query.
		 *
		 * The nodes are returned according to the ordering specified in the query.
		 *
		 * @param int prefetch If to prefetch or not
		 * int < 0/true means all, 0/false means none, int > 0 means the prefetch chunk size or none
		 * @return an array of {@link Node} objects 
		 *
		 * @throws RepositoryException if the query contains more than one selector, if this call is
		 *                                    the second time either get_rows or get_nodes has been called on the
		 *                                    same QueryResult object or if another error occurs.
		 */
		public abstract Node[] get_nodes (int prefetch);

		/**
		 * Returns an array of all the selector names that were used in the query
		 * that created this result.
		 *
		 * If the query did not have a selector name then an empty array is returned.
		 *
		 * @return array holding the selector names.
		 *
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract string[] get_selector_names ();
	}
}
